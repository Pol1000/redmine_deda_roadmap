Redmine::Plugin.register :redmine_deda_roadmap do
  name 'Redmine Deda Roadmap plugin'
  author 'Paolo Boldrini'
  description 'customization of Roadmap '
  version '0.0.1'
  url ''
  author_url ''
  
project_module :deda_roadmap do

    permission :edit_deda_roadmap, {:deda_roadmap => [:edit, :update, :new, :create, :gestione, :destroy]}
      
  end

end


