class Admin::ContributeController < Admin::BaseController
  def dashboard
    @missing = params[:missing].presence_in(%w[ location line ]) || session[:last_missing] || "location"
    session[:last_missing] = @missing

    filtered = ->(arel, missing) { missing == "line" ? arel.without_line_only : arel.without_location }

    puts "=================================="
    puts filtered
    puts filtered.call(Area.published.first.problems, @missing).count
    puts Area.published.first.problems.count
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


    @areas_with_stats = Area.published.
      map { |a| OpenStruct.new(
          area: a,
          ascents: a.problems.sum(:ascents),
          completion: 1 - filtered.call(a.problems, @missing).count.to_f / a.problems.count.to_f || 1,
          upcoming_completion: 1 - filtered.call(a.problems, @missing).without_contribution_request.count.to_f / a.problems.count.to_f || 1
        )
      }.
      sort_by(&:ascents).reverse
  end
end
