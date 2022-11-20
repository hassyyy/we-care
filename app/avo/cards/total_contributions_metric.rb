class TotalContributionsMetric < Avo::Dashboards::MetricCard
  self.id = 'total_contributions_metric'
  self.label = 'Total Contributions'
  self.prefix = '₹'
  self.cols = 2

  query do
    contributions = Contribution.where(status: 'sent').sum(:value)

    result number_to_currency(contributions, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
