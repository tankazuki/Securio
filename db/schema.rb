# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_24_004105) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "mail"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camera_codecs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "camera_id"
    t.bigint "codec_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_id"], name: "index_camera_codecs_on_camera_id"
    t.index ["codec_id"], name: "index_camera_codecs_on_codec_id"
  end

  create_table "camera_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "camera_image_id"
    t.bigint "camera_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_id"], name: "index_camera_images_on_camera_id"
  end

  create_table "cameras", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "camera_name"
    t.integer "resolution"
    t.integer "camera_type"
    t.integer "audio"
    t.string "size"
    t.integer "weight"
    t.bigint "manufacturer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "favorites_count"
    t.index ["manufacturer_id"], name: "index_cameras_on_manufacturer_id"
  end

  create_table "codecs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "codec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "camera_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_id"], name: "index_favorites_on_camera_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "manufacturers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "manufacturer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "news_type"
    t.string "news_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "report_text"
    t.bigint "camera_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_id"], name: "index_reports_on_camera_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "review_text"
    t.text "review_image"
    t.bigint "camera_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_id"], name: "index_reviews_on_camera_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname"
    t.string "mail"
    t.string "password_digest"
    t.string "user_image_id"
    t.boolean "enable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "camera_codecs", "cameras"
  add_foreign_key "camera_codecs", "codecs"
  add_foreign_key "camera_images", "cameras"
  add_foreign_key "cameras", "manufacturers"
  add_foreign_key "favorites", "cameras"
  add_foreign_key "favorites", "users"
  add_foreign_key "reports", "cameras"
  add_foreign_key "reports", "users"
  add_foreign_key "reviews", "cameras"
  add_foreign_key "reviews", "users"
end
