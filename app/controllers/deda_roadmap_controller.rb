
class DedaRoadmapController < ApplicationController
  
  
  def evade
    issue= Issue.find_by_id(params[:id])

    testo_nota = params[:testo]
    if !testo_nota.nil? 
      local_journal = issue.journals.find(:last)
      local_journal.update_attributes(:notes => testo_nota)
    else
      local_journal = issue.journals.find(:last)
      local_journal.update_attributes(:notes => "issue close")
    end
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
  

end
