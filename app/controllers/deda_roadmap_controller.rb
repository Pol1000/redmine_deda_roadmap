
class DedaRoadmapController < ApplicationController
  
  
  def evade
    issue= Issue.find_by_id(params[:id])
    
    testo_nota = params[:testo][:name]
    stato = params[:sel]
    local_journal = issue.journals.find(:last)
    
    if testo_nota.nil? || testo_nota == ''
      testo_nota = "segnalazione chiusa"
      
    end
    notaLocale = local_journal.notes
    notaLocale+=testo_nota
    local_journal.update_attributes(:notes => testo_nota)
    
    issue.status = IssueStatus.find_by_id(stato)
    issue.save
    render :update do |page| page << 'window.location.reload()' end
  end
  
  
  
end
