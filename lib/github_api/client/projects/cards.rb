# encoding: utf-8

module Github
  class Client::Projects::Cards < API

    def create(*args)
      arguments(args, required: [:column_id]) do
        assert_required %w(content_id)
      end
      params = arguments.params

      params["accept"] ||= Github::Client::Projects::PREVIEW_MEDIA

      # manually create data w/ content_type since it is a 'reserved word'
      params["data"] = params.data
      params["data"]["content_type"] = "Issue"

      post_request("/projects/columns/#{arguments.column_id}/cards", arguments.params)
    end

  end # Client::Projects::Cards
end # Github
