class GraphqlController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :login_verify

  include JsonWebToken

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    result = Survey5Schema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
    rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  private

  def context 
    context = {
      current_user: JsonWebToken::Jwt.new.decode_token(request),
      request: request
      }
  end

  def login_verify
    operation_name = params[:operationName]
    query = params[:query]

    unless operation_name == "CreateUser" || operation_name == "SigninUser" || query.include?('IntrospectionQuery')
      if context[:current_user].nil?
        raise GraphQL::ExecutionError, "Usuário não logado"
      end
    end
    if operation_name == "CreateUser" || operation_name == "SigninUser"
      raise GraphQL::ExecutionError, "Usuário já esta logado" if context[:current_user] # Verifica se não já tem um token e, portanto, o usuário já está logado
    end

  end
  
  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end


  
end
