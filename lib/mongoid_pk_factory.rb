require 'mongoid'

Mongoid::Identity.module_eval do
protected
  class << self
    # Return the proper id for the document.
    def generate_id
      if Mongoid.master.pk_factory
        id_hash = Mongoid.master.pk_factory.create_pk({})
        id = id_hash['_id'] || id_hash[:_id]
      else
        id = Mongo::ObjectID.new
      end
      Mongoid.use_object_ids ? id : id.to_s
    end
  end # class << self
end