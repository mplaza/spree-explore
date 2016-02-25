require 'spec_helper'

describe PointAgreement do 
	before(:all) do
		@category = PointCategory.create(category: 'like');
	end
	it 'should allow you to create a new point agreement with an action and price' do
		numAgreements = PointAgreement.count
		agreement = PointAgreement.create(point_category_id: @category.id, cost_per_point: 0.05)
		expect(PointAgreement.last.cost_per_point).to eq(0.05)
		expect(PointAgreement.count).to eq(numAgreements + 1)
	end

	it 'should belong to point category' do
		agreement = PointAgreement.create(point_category_id: @category.id)
		expect(PointAgreement.last.point_category).to eq(@category)
	end
end