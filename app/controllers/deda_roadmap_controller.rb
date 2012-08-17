
class DedaRoadmapController < ApplicationController
  
  
  def evade
    issue= Issue.find_by_id(params[:id])
    
    testo_nota = params[:testo][:name]
    local_journal = issue.journals.find(:last)
    
    if testo_nota.nil? || testo_nota == ''
      testo_nota = "segnalazione chiusa"
      
    end
    local_journal.update_attributes(:notes => testo_nota)
    
    
    
    stato = nil
    IssueStatus.find(:all).each do |status|
      if(status.name == "Evasa")
        stato = status
      end
    end
    if(stato!=nil)
      issue.status = stato
    else
      issue.status = IssueStatus.create(:name => "Evasa", :is_closed => true)
    end
    issue.save
    render :update do |page| page << 'window.location.reload()' end
  end
  
  
  def respingi
    issue= Issue.find_by_id(params[:id])
    
    testo_nota = params[:testo][:name]
    local_journal = issue.journals.find(:last)
    if testo_nota.nil? || testo_nota == ''
      testo_nota = "segnalazione chiusa"
      
    end
    local_journal.update_attributes(:notes => testo_nota)
    
    
    stato = nil
    IssueStatus.find(:all).each do |status|
      if(status.name == "Respinta")
        stato = status
      end
    end
    if(stato!=nil)
      issue.status = stato
    else
      issue.status = IssueStatus.create(:name => "Respinta", :is_closed => true)
    end
    issue.save
    render :update do |page| page << 'window.location.reload()' end
  end
  
end
