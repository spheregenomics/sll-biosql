# == Schema Information
#
# Table name: taxon_with_name
#
#  taxon_id          :integer         primary key
#  parent_taxon_id   :integer
#  ncbi_taxon_id     :integer
#  node_rank         :string(32)
#  genetic_code      :integer(2)
#  mito_genetic_code :integer(2)
#  left_value        :integer
#  right_value       :integer
#  scientific_name   :string(255)
#  wgs               :boolean
#

class TaxonWithName < ActiveRecord::Base
  #attr_accessible :title, :body
  self.table_name = 'taxon_with_name'
  self.primary_key = 'taxon_id'

  belongs_to :parent, :class_name => 'TaxonWithName', :foreign_key => :parent_taxon_id
  belongs_to :children, :class_name => 'TaxonWithName', :foreign_key => :parent_taxon_id

  has_many :protein_gi_taxons, :foreign_key => :taxon_id
end