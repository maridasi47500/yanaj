class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :image
      t.text :content
      t.string :url
      t.string :excerpt
      t.timestamps
    end
    create_table :events do |t|
      t.string :title
      t.date :startdate
      t.time :starttime
      t.time :endtime
      t.date :enddate
      t.text :content
      t.string :url
        t.timestamps
    end
    create_table :newshaveorgas do |t|
      t.integer :news_id
      t.integer :orga_id
    end

    create_table :orgas do |t|
      t.string :name
        t.timestamps
    end

    create_table :plans do |t|
      t.string :title
      t.string :image
      t.text :intro
      t.text :description
      t.text :readmore
      t.string :url
        t.timestamps
    end
    create_table :planshavecityzones do |t|
      t.integer :plan_id
      t.integer :cityzone_id
     
    end
     create_table :cityzones do |t|
      t.string :name
      t.timestamps
     
    end
create_table :cityzoneshavecities do |t|
      t.integer :city_id
      t.integer :cityzone_id
     
    end
   create_table :cities do |t|
      t.string :name
      t.timestamps
     
    end
   create_table :planshaveaddresses do |t|
      t.integer :plan_id
      t.integer :address_id
      t.timestamps
     
    end
    create_table :addresses do |t|
        t.integer :cityzone_id
        t.string :place
        t.string :street
        t.string :zip
        t.string :city
        t.string :phone1
        t.string :phone2
        t.string :email
        t.string :website
        t.text :schedule
        t.string :latitude
        t.string :longitude
        t.string :fb
        t.timestamps
        
    end
    create_table :someotherplans do |t|
      t.integer :plan_id
      t.integer :otherplan_id
     
    end
    create_table :someothernews do |t|
      t.integer :news_id
      t.integer :othernews_id
     
    end

    create_table :videos do |t|
      t.string :url
      t.string :title
      t.string :videoid
      t.timestamps
      
     
    end
      create_table :planshavevideos do |t|
      t.integer :plan_id
      t.integer :video_id
     
    end
  
    create_table :topics do |t|
      t.string :name
      t.string :title
      t.string :image
      t.string :content
t.string :url
t.timestamps
    end
    create_table :links do |t|
        t.integer :topic_id
      t.string :name
      t.string :url
t.timestamps
    end
    create_table :newshavetopics do |t|
      t.integer :news_id
      t.integer :topic_id
      
    end
    create_table :topiccats do |t|
      t.string :title
      t.string :image
      t.integer :topic_id
      
    end
    create_table :topiccatshavecategories do |t|
      t.integer :category_id
      t.integer :topiccat_id
      
    end

    create_table :eventshavetopics do |t|
      t.integer :event_id
      t.integer :topic_id
    end
    create_table :categories do |t|
      t.string :title
      t.string :image
      t.text :intro
      t.text :description
      t.text :readmore
      t.string :url
      t.timestamps
    end
    create_table :categorieshaveplans do |t|
      t.integer :category_id
      t.integer :plan_id
    end
  end
end
