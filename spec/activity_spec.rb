RSpec.describe Activity do
	describe "#save" do
		it "save activity" do
			activity = Activity.new
			activity.name = 'oi'
			activity.save
			expect(activity.id).to be > 0
		end
	end
end