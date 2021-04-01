# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_130_153_655) do
  create_table 'active_storage_attachments',
               options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci',
                                       force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'comments', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci',
                           force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'feature_id'
    t.text 'comment', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['feature_id'], name: 'index_comments_on_feature_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'features', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci',
                           force: :cascade do |t|
    t.bigint 'project_id'
    t.string 'title', null: false
    t.string 'description', null: false
    t.string 'panel_name'
    t.integer 'ticket_id', null: false
    t.string 'file'
    t.integer 'status', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['project_id'], name: 'index_features_on_project_id'
  end

  create_table 'features_users', id: false,
                                 options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'feature_id'
    t.bigint 'user_id'
    t.index ['feature_id'], name: 'index_features_users_on_feature_id'
    t.index ['user_id'], name: 'index_features_users_on_user_id'
  end

  create_table 'notifications', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci',
                                force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'actor_id'
    t.string 'notify_type', null: false
    t.string 'target_type'
    t.bigint 'target_id'
    t.string 'second_target_type'
    t.bigint 'second_target_id'
    t.string 'third_target_type'
    t.bigint 'third_target_id'
    t.datetime 'read_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[user_id notify_type], name: 'index_notifications_on_user_id_and_notify_type'
    t.index ['user_id'], name: 'index_notifications_on_user_id'
  end

  create_table 'projects', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci',
                           force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_projects_on_user_id'
  end

  create_table 'sessions', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci',
                           force: :cascade do |t|
    t.string 'session_id', null: false
    t.text 'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['session_id'], name: 'index_sessions_on_session_id', unique: true
    t.index ['updated_at'], name: 'index_sessions_on_updated_at'
  end

  create_table 'tasks', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci',
                        force: :cascade do |t|
    t.bigint 'feature_id'
    t.string 'description', null: false
    t.boolean 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['feature_id'], name: 'index_tasks_on_feature_id'
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci',
                        force: :cascade do |t|
    t.string 'name'
    t.string 'email', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password_digest'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'comments', 'features'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'features', 'projects'
  add_foreign_key 'projects', 'users'
  add_foreign_key 'tasks', 'features'
end
