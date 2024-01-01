class YearlyExpenses < Avo::Dashboards::PartialCard
    self.id = "yearly_expenses"
    self.partial = "avo/cards/yearly_expenses"
    self.display_header = false
    self.rows = 15
    self.cols = 5
  end
  