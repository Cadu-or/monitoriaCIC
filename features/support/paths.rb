# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^página inicial do MonitoriaCIC$/
      root_path

    when /^página de registro de alunos$/
      new_user_path

    when /^página de registro de professores$/
      new_professor_path

    when /^página de dashboard do usuário$/
      dashboard_path

    when /^página de disciplinas$/
      disciplinas_path

    when /^página de informações da disciplina (.*)$/
      disciplina_path(Disciplina.find($1))

    when /^página de edição da disciplina (.*)$/
      edit_disciplina_path(Disciplina.find($1))

    when /^página de nova disciplina$/
      new_disciplina_path

    when /^página de login de usuários$/
      new_session_path

    when /^página de FAQ$/
      faq_path

    when /^página de editar perfil do usuário$/
      dashboard_edit_user_path

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
