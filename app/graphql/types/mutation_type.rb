module Types
  class MutationType < Types::BaseObject
    # Survey
    field :create_survey, mutation: Mutations::SurveyMutations::CreateSurvey
    field :update_survey, mutation: Mutations::SurveyMutations::UpdateSurvey
    field :delete_survey, mutation: Mutations::SurveyMutations::DeleteSurvey

    # User
    field :create_user, mutation: Mutations::UserMutations::CreateUser
    field :signin_user, mutation: Mutations::UserMutations::SignInUser

    # Question
    field :create_question, mutation: Mutations::QuestionMutations::CreateQuestion
    field :update_question, mutation: Mutations::QuestionMutations::UpdateQuestion
    field :delete_question, mutation: Mutations::QuestionMutations::DeleteQuestion

    #Response 
    field :create_response, mutation: Mutations::ResponseMutations::CreateResponse
    field :update_response, mutation: Mutations::ResponseMutations::UpdateResponse

  end
end
