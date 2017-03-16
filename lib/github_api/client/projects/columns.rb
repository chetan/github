# encoding: utf-8

module Github
  class Client::Projects::Columns < API

    def list(*args)
      arguments(args, required: [:project_id])
      arguments.params["accept"] ||= Github::Client::Projects::PREVIEW_MEDIA

      response = get_request("/projects/#{arguments.project_id}/columns", arguments.params)
      return response unless block_given?
      response.each { |el| yield el }
    end
    alias_method :all, :list

  end # Client::Projects::Columns
end # Github
