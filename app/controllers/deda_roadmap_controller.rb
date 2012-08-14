
class DedaRoadmapController < ApplicationController
  
  
  def evade
    issue= Issue.find_by_id(params[:id])
    testo_nota = params[:id]
    if !testo_nota.nil? 
      local_journal = issue.journals.find(:last)
      local_journal.update_attributes(:notes => testo_nota)
    end
#    respond_to do |format|
#        format.html {  redirect_to :controller => 'versions', :action => 'index', :project_id =>params[:project] }
#   end
render :update do |page| page << 'window.location.reload()' end
  end
  

end
