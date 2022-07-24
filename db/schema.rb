# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_21_001602) do

  create_table "addresses", force: :cascade do |t|
    t.integer "cityzone_id"
    t.string "place"
    t.string "street"
    t.string "zip"
    t.string "city"
    t.string "phone1"
    t.string "phone2"
    t.string "email"
    t.string "website"
    t.text "schedule"
    t.string "latitude"
    t.string "longitude"
    t.string "fb"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.text "intro"
    t.text "description"
    t.text "readmore"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categorieshaveplans", force: :cascade do |t|
    t.integer "category_id"
    t.integer "plan_id"
  end

  create_table "catshavecats", force: :cascade do |t|
    t.integer "category_id"
    t.integer "othercategory_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cityzones", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cityzoneshavecities", force: :cascade do |t|
    t.integer "city_id"
    t.integer "cityzone_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.date "startdate"
    t.time "starttime"
    t.time "endtime"
    t.date "enddate"
    t.text "content"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "excerpt"
  end

  create_table "eventshaveevents", force: :cascade do |t|
    t.integer "event_id"
    t.integer "otherevent_id"
  end

  create_table "eventshavetopics", force: :cascade do |t|
    t.integer "event_id"
    t.integer "topic_id"
  end

  create_table "links", force: :cascade do |t|
    t.integer "topic_id"
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.text "content"
    t.string "url"
    t.string "excerpt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "newshaveorgas", force: :cascade do |t|
    t.integer "news_id"
    t.integer "orga_id"
  end

  create_table "newshavetopics", force: :cascade do |t|
    t.integer "news_id"
    t.integer "topic_id"
  end

  create_table "orgas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pagesites", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.text "intro"
    t.text "description"
    t.text "readmore"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "mycontent"
  end

  create_table "planshaveaddresses", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "address_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "planshavecityzones", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "cityzone_id"
  end

  create_table "planshavevideos", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "video_id"
  end

  create_table "someothernews", force: :cascade do |t|
    t.integer "news_id"
    t.integer "othernews_id"
  end

  create_table "someotherplans", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "otherplan_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.integer "topic_id"
    t.text "content"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "topiccats", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.integer "topic_id"
  end

  create_table "topiccatshavecategories", force: :cascade do |t|
    t.integer "category_id"
    t.integer "topiccat_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "image"
    t.string "content"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.string "videoid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
