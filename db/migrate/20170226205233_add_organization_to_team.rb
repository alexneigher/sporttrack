class AddOrganizationToTeam < ActiveRecord::Migration[5.0]
  def change
    add_reference :teams, :organization
  end
end
