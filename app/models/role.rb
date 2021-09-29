class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map {|audition| audition.actor}
  end

  def locations
    self.auditions.map {|audition| audition.location}
  end

  def lead
    leadAudition = self.auditions.find_by(hired: true)
    if leadAudition
        leadAudition
    else
        "no actor has been hired for this role"
    end
  end

  def understudy
    auditionsHired = self.auditions.where(hired: true)
    if auditionsHired[1]
        auditionsHired[1]
    else
        "no actor has been hired for understudy for this role"
    end
  end
end