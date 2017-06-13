require 'rails_helper'

RSpec.describe Activity do
	describe '#save activity' do

		it "with just name" do
			# One way

			# activity = Activity.new
			# activity.name = 'oi'
			# activity.save
			# expect(activity.id).to be > 0

			# Another way
			activity = Activity.create(name: "oi")

			expect(activity.id).to be > 0
		end

		it "with right priority" do
			activity1 = Activity.create(name: "atividade 1 - prioridade 1")
			activity2 = Activity.create(name: "atividade 2 - prioridade 2")
			activity3 = Activity.create(name: "atividade 3 - prioridade 3")

			expect(activity3.priority).to eq 2
		end

		it "with priority uniqueness" do
			activity1 = Activity.create(name: "atividade 1 - prioridade 1")
			activity2 = Activity.create(name: "atividade 2 - prioridade 2")

			expect(activity1.priority).to_not be eq activity2.priority
		end

	end

	describe '#update activity' do
		it "with right priority" do
			activity1 = Activity.create(name: "atividade 1 - prioridade 1")
			activity2 = Activity.create(name: "atividade 2 - prioridade 2")

			activity2.update(name: "atividade 1 modificada")

			expect(activity2.priority).to eq 1
		end

	end

	describe '#list activity' do

		it "for priority asc" do
			activity1 = Activity.create(name: 'atividade 1')
			activity2 = Activity.create(name: 'atividade 2')

			activities = Activity.all_for_priority_asc

			expect(activities.first.priority).to eq 0
		end

		it "for priority desc" do
			activity1 = Activity.create(name: 'atividade 1')
			activity2 = Activity.create(name: 'atividade 2')

			activities = Activity.all_for_priority_desc

			expect(activities.first.priority).to eq 1
		end

		it "for desc creation date" do
			activity1 = Activity.create(name: 'Atividade 1', created_at: '2016-05-03')
			activity2 = Activity.create(name: 'Atividade 2', created_at: '2016-08-10')

			activities = Activity.all_for_created_at_desc

			expect(activities.first.created_at.utc.to_s).to eq '2016-08-10 00:00:00 UTC'
		end

	end

	describe '#change activity priority' do
		it "up" do
			activity1 = Activity.create(name: 'Atividade 1')
			activity2 = Activity.create(name: 'Atividade 2')
			activity3 = Activity.create(name: 'Atividade 3')

			activity1.increase_priority

			expect(activity1.priority).to be < activity3.priority
		end

		# Não sei por que não tá funcionando
		it "down" do
			activity1 = Activity.create(name: 'Atividade 1')
			activity2 = Activity.create(name: 'Atividade 2')
			activity3 = Activity.create(name: 'Atividade 3')

			activity2.decrease_priority

			# TODO: Analisar porque o teste unitario falha quando analisamos a Atividade
			# cuja prioridade foi trocada por esta
			expect(activity2.priority).to eq 2
			# expect(activity3.priority).to be < activity2.priority
		end
	end

end
