FactoryGirl.define do
  factory :taxon_with_name do
    factory :taxon do
      sequence(:ncbi_taxon_id){ |n| "10#{n}" }
      sequence(:taxon_id){ |n| "10#{n}" }
      parent_taxon
      wgs 'true'
    end
  end

  factory :taxon_attribute do
    ncbi_taxon_id	544404
    type		'NCBI FTP genome protein file path'
    value		'genomes/Bacteria/Escherichia_coli_O157_H7_TW14359_uid59235'
  end

  factory :organism_group do
    name	'wgs'
    test	false
  end

  factory :organism_group_test do
    name	'wgs_test_10'
    test	true
  end

  factory :function do
    name	'test function'
    source_db	'test source'
  end

  factory :seed_root, class: "Function" do
    name	'SEED'
    source_db	'SEED'
  end

  factory :seed_child0, class: "Function" do
    name	'child0'
    source_db	'SEED'
    parent	{ FactoryGirl.create(:seed_root) }
  end
end
