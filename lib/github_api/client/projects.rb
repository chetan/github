# encoding: utf-8

module Github
  class Client::Projects < API

    PREVIEW_MEDIA = 'application/vnd.github.inertia-preview+json'.freeze # :nodoc:

    require_all 'github_api/client/projects', 'cards', 'columns'

    namespace :columns
    namespace :cards

    def list(*args)
      params = arguments(args).params
      params["accept"] ||= PREVIEW_MEDIA

      org = params.delete('org')
      repo = params.delete('repo')
      owner = params.delete('owner')

      response = if org
        get_request("/orgs/#{org}/projects", params)
      elsif repo and owner
        get_request("/repos/#{owner}/#{repo}/projects", params)
      else
        raise "must pass org or repo and owner"
      end

      return response unless block_given?
      response.each { |el| yield el }
    end
    alias_method :all, :list

  end # Projects
end # Github
