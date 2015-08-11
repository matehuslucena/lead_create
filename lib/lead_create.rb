class LeadCreate
  def self.create(contato)
    lead = get_lead_object
    @lead = lead.new
    @lead = load_new_lead(contato)
    if @lead.save
      contato.name + ' successfully added'
    end
  end

  def self.list_leads
    lead = get_lead
    lead.all
  end

  private
  def get_lead_object
    client = Databasedotcom::Client.new('config/databasedotcom.yml')
    client.authenticate :username => 'matheuslucena@gmail.com', :password => 'slayer666DT0tilUUmpLca7X5kWKGCKDf'
    client.materialize('Lead')
  end

  def load_new_lead(contato)
    user = client.materialize('User')
    @lead.OwnerId = user.first.Id
    @lead.FirstName = contato.name
    @lead.LastName = contato.last_name
    @lead.Email = contato.email
    @lead.Company = contato.company
    @lead.Title = contato.job_title
    @lead.Phone = contato.phone
    @lead.Website = contato.website
    @lead.IsConverted = false
    @lead.IsUnreadByOwner = true
  end
end