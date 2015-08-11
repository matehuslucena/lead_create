class LeadCreate
  def self.create(contato)
    client = Databasedotcom::Client.new('config/databasedotcom.yml')
    client.authenticate :username => client.username, :password => client.password
    lead = client.materialize('Lead')
    user = client.materialize('User')
    @lead = lead.new
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
    if @lead.save
      contato.name + ' successfully added'
    end
  end
end