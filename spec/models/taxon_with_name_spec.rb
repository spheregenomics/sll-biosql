require 'spec_helper'

describe TaxonWithName do
  it 'should return the root taxon' do
    root = TaxonWithName.root
    root.should_not == nil
    root.scientific_name.should == 'root'
  end

  before do 
    @root = TaxonWithName.root 
    @cellular = TaxonWithName.find_by_scientific_name('cellular organisms') 
    @bacteria = TaxonWithName.find_by_scientific_name('Bacteria')
    @enterophage = TaxonWithName.find_by_scientific_name('Enterobacteria phage PRD1')
    @homo = TaxonWithName.find_by_scientific_name('Homo')
    @hs = TaxonWithName.find_by_scientific_name('Homo sapiens')
    @hs = TaxonWithName.find_by_scientific_name('Homo sapiens')
    @neanderthal = TaxonWithName.find_by_scientific_name('Homo sapiens neanderthalensis')
  end

  subject { @root }

  it { should respond_to(:parent) }
  its(:parent) { should == @root }

  it { should respond_to(:children) }
  its(:children) { should include @cellular }

  describe 'parent-child relationsships' do
    subject { @hs }

    its(:parent) { should == @homo }
    its(:children) { should == [ @neanderthal ] }
  end

  describe 'whole genome sequenced' do
    before do
      @wgs_taxa = TaxonWithName.find_all_by_wgs(true)
    end

    subject { @wgs_taxa }

    its(:length) { should > 0 }
    it { should include @enterophage }
    it { should_not include @bacteria }
  end
end
