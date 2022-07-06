class ContributionsMetric < Avo::Dashboards::MetricCard
  self.id = 'contributions_metric'
  self.label = 'Contributions'
  self.prefix = '₹'

  query do
    contributions = Contribution.where(status: 'sent').sum(:value)

    result number_to_currency(contributions, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
