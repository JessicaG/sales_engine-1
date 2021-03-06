require_relative 'test_helper'
require './lib/merchant'

class MerchantTest < Minitest::Test

  attr_reader :merchant_repository

  def setup
    engine = SalesEngine.new(fixtures_directory)
    engine.startup
    @merchant_repository = engine.merchant_repository
  end

  def test_merchant_has_an_id
    data = { id: "1", name: "Ace", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC" }
    repository = "merchant repo"

    merchant = Merchant.new(data, repository)

    assert_equal 1, merchant.id
  end

  def test_merchant_has_a_name
    data = { id: "1", name: "Ace", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC" }
    repository = "merchant repo"

    merchant = Merchant.new(data, repository)

    assert_equal "Ace", merchant.name
  end

  def test_find_items_returns_items_associated_with_merchant
    result = @merchant_repository.merchants.first.items
    assert_equal 10, result.count

  end

  def test_find_invoices_returns_invoices_associated_with_merchant
    result = @merchant_repository.merchants[9].invoices
    assert_equal 1, result.count
  end

  private

  def fixtures_directory
    File.expand_path('../../data/fixtures', __FILE__)
  end

end
