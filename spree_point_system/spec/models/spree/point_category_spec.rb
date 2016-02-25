require 'spec_helper'
require 'date'

describe PointCategory do 

	it 'should allow you to create a new category' do
		numAgreements = PointCategory.count
		category = PointCategory.create(category: 'pictorial_like')
		expect(PointCategory.last.category).to eq('pictorial_like')
		expect(PointCategory.count).to eq(numAgreements + 1)
	end

	it 'should allow for an attached agreement' do
		@category = PointCategory.create(category: 'product_like');
		expect(@category.point_agreement).to eq(nil)
		agreement = @category.create_point_agreement(point_category_id: @category.id, cost_per_point: 0.10)
		expect(@category.point_agreement).to eq(agreement)
	end

	it 'should return the count for the current month' do
		@category = PointCategory.create(category: 'pictorial_like');
		agreement = @category.create_point_agreement(point_category_id: @category.id, cost_per_point: 0.05)
		action1 = PointAction.create(point_category_id: @category.id, created_at: DateTime.now)
		action2 = PointAction.create(point_category_id: @category.id, created_at: DateTime.now)
		action3 = PointAction.create(point_category_id: @category.id, created_at: (DateTime.now - 2.months))
		expect(@category.count_for_current_month).to eq(2)
	end

	it 'should return the price for the current month' do
		@category = PointCategory.create(category: 'pictorial_like');
		agreement = @category.create_point_agreement(point_category_id: @category.id, cost_per_point: 0.10)
		action1 = PointAction.create(point_category_id: @category.id, created_at: DateTime.now)
		action2 = PointAction.create(point_category_id: @category.id, created_at: DateTime.now - 1.day)
		action3 = PointAction.create(point_category_id: @category.id, created_at: (DateTime.now - 4.months))
		expect(@category.cost_for_current_month).to eq(0.20)
	end

end