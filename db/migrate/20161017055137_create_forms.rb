class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      # default PRIMARY KEY is :id (automatically generated, and we do use it!)
      t.string :id_user # User ID (set to the UID when the user first creates the form)
      
      t.string :form_type # Form Type ("atrisk" or "autism")
      t.string :photo_path # Photo of the Individual (this is the location of the photo file stored in the system)
      t.string :name
      t.string :address
      t.boolean :live_alone # Individual Lives Alone? (T=Yes, F=No)
      t.date :birth_date
      t.string :nickname
      t.string :sex # Individual's Sex ("male" or "female")
      t.string :height
      t.string :weight
      t.string :color_eye
      t.string :color_hair
      t.text :body_marks # Scars, Tattoos, or Other Identifying Marks
      t.text :other_medical_conds # Other Reverent Medical Conditions
      t.text :meds_needed # Prescription Medicines Needed
      t.integer :phone_number # Individual's Cell Phone Number
      t.string :phone_company # Individual's Cell Phone Provider Company
      t.string :ec1_name # Emergency Contact 1
      t.string :ec1_address
      t.integer :ec1_phone_home
      t.integer :ec1_phone_work
      t.integer :ec1_phone_cell
      t.string :ec2_name # Emergency Contact 2
      t.string :ec2_address
      t.integer :ec2_phone_home
      t.integer :ec2_phone_work
      t.integer :ec2_phone_cell
      t.string :preferred_language # Individual's Preferred Spoken Language
      t.text :info_id # Individual's Identification Information
      t.text :info_tracking # Individual's Tracking Information
      t.boolean :has_alzheimers # Individual has this disorder? (T=Yes, F=No)
      t.boolean :has_dementia
      t.boolean :has_down_syndrome
      t.boolean :has_other_disorders
      t.text :other_disorders # Specify Other Related Disorders
      t.text :sensory_dietary_issues # Sensory or Dietary Issues
      t.text :calming_methods
      t.text :info_other_first_resp # Any Other Information First Responders May Need
      t.text :attractions_locations # Nearby water sources & favorite attractions or locations where the individual may be found
      t.text :atypical_behaviors # Atypical behaviors or characteristics of the individual that may affect the attention of responders
      t.text :favorite_topics # Individual's favorite toys, objects, music, discussion topics, likes, and dislikes
      t.text :communication_method_1 # Method of Preferred Communication
      t.text :communication_method_2
      t.boolean :form_activeness # Activeness of the form (T=Active=Display2User F=Inactive=HideFromUser)
      
      # I insist to give us 3 future-proof does-nothing fields so we won't have to deal with nasty db migrations
      t.boolean :dummy_boolean
      t.string :dummy_string
      t.text :dummy_text

      # Add fields that let Rails automatically keep track of the datetime 
      # an entry is added or modified:
      t.timestamps
    end
  end
end
