module YamlHelper
  def yaml_web_editor_link(project)
    commits = project.ci_commits

    if commits.any? && commits.last.ci_yaml_file
      "#{project.gitlab_url}/edit/master/.gitlab-ci.yml"
    else
      "#{project.gitlab_url}/new/master"
    end
  end
end
