module SoftDestroyOverrideMethods
  def hard_destroy
    destroy :hard
  end

  def soft_destroy
    destroy :soft
  end

  def hard_delete
    destroy :hard
  end

  def soft_delete
    destroy :soft
  end

  def delete(mode = :soft)
    destroy mode
  end

  def soft_destroy_enabled?
    true
  end

  def destroy(mode = :soft)
    transaction do
      association_reflections = self.class.reflections.select do |name, reflection|
        reflection.options[:dependent] == :destroy
      end

      if association_reflections.any?
        association_reflections.each do |name, association|
          dependent_association_data = self.send(name)

          if association.collection?
            dependent_association_data.each do |dependent_record|
              if dependent_record.soft_destroy_enabled?
                dependent_record.destroy(mode)
              else
                dependent_record.destroy
              end
            end
          else
            if dependent_record.soft_destroy_enabled?
              dependent_association_data.destroy(mode)
            else
              dependent_association_data.destroy
            end
          end
        end
      end
      if mode == :soft
        update_attribute :deleted, true
      else
        active_record_delete
      end
    end
  end

end
