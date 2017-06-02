require 'rails_helper'

RSpec.describe Activity do
	describe '#save activity' do
		it "save activity with just name" do
			# One way

			# activity = Activity.new
			# activity.name = 'oi'
			# activity.save
			# expect(activity.id).to be > 0

			# Another way
			activity = Activity.create(name: "oi")

			expect(activity.id).to be > 0
		end
	end

	describe '#list activity' do
		it "for priority asc" do
			activity1 = Activity.create(name: 'oi1', priority: 2)
			activity2 = Activity.create(name: 'oi2', priority: 3)

			activities = Activity.all_for_priority_asc

			expect(activities.first.priority).to eq 2
		end
		it "for priority desc" do
			activity1 = Activity.create(name: 'oi1', priority: 2)
			activity2 = Activity.create(name: 'oi2', priority: 3)

			activities = Activity.all_for_priority_desc

			expect(activities.first.priority).to eq 3
		end
		it "for desc creation date" do
			activity1 = Activity.create(name: 'Atividade 1', created_at: '2016-05-03')
			activity2 = Activity.create(name: 'Atividade 2', created_at: '2016-08-10')

			activities = Activity.all_for_created_at_desc

			# expect(activities.first.created_at.utc.to_s).to eq '2016-08-10'
			expect(activities.first.created_at.utc.to_s).to eq '2016-08-10 00:00:00 UTC'
		end
	end
	
end