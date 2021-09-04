FactoryBot.define do
    factory :publisher do 
        name { FFaker::CompanyIT.name}
        fundation { Time.zone.today - rand(05..150).years }
        country {"Italy"}
    end 
end