#tag Class
Protected Class RecentCompletedPlansDataSource
Implements WebDataSource
	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "mrn" // the name of the field in your database or data source
		  col.Heading = "MRN" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "80"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "full_name" // the name of the field in your database or data source
		  col.Heading = "Full Name" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "200"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "site" // the name of the field in your database or data source
		  col.Heading = "Site" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "plan_type" // the name of the field in your database or data source
		  col.Heading = "Plan Type" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "280"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "completion_date" // the name of the field in your database or data source
		  col.Heading = "Completed On" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "initials" // the name of the field in your database or data source
		  col.Heading = "Planner" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "physician_initials" // the name of the field in your database or data source
		  col.Heading = "Physician" // the name that appears above the column
		  col.Sortable = True // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  
		  Var sql As String = "SELECT COUNT(*) as c FROM physics_tasking.plans WHERE " _
		  + "physics_tasking.plans.is_completed = 1 " _
		  + "AND completion_date > '" + d_min.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "'"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  Return rs.Column("c").IntegerValue
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  
		  Var rows() As WebListboxRowData
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id, " _
		  + "physics_tasking.patients.mrn As mrn, " _
		  + "physics_tasking.patients.first_name As first_name, " _
		  + "physics_tasking.patients.family_name As family_name, " _
		  + "physics_tasking.plan_types.name As plan_type_name, " _
		  + "physics_tasking.sites.name As site, " _
		  + "physics_tasking.sites.is_uppercase As is_uppercase, " _
		  + "DATE(physics_tasking.plans.completion_date) as completion_date, " _
		  + "physics_tasking.users.first_name As u_first_name, " _
		  + "physics_tasking.users.family_name As u_family_name, " _
		  + "physics_tasking.users.initials As initials, " _
		  + "physics_tasking.plans.is_replan as is_replan, " _
		  + "(" _
		  + "SELECT physics_tasking.users.initials " _
		  + "FROM physics_tasking.users " _
		  + "WHERE physics_tasking.plans.physician_id = physics_tasking.users.user_id" _
		  +") As physician_initials " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING (site_id) " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "WHERE physics_tasking.plans.is_completed = 1 " _
		  + "AND DATE(completion_date) > '" + d_min.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "'" _
		  + "ORDER BY DATE(physics_tasking.plans.completion_date) DESC, physics_tasking.patients.mrn ASC;"
		  
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("plan_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, rs.Column("mrn").StringValue.Trim)
		    row.Value("mrn") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    rs.Column("first_name").StringValue.Trim.Titlecase + " " _
		    + rs.Column("family_name").StringValue.Trim.Uppercase)
		    row.Value("full_name") = cellRenderer
		    
		    If rs.Column("is_uppercase").BooleanValue Then
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("site").StringValue.Trim.Uppercase)
		      
		    Else
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("site").StringValue.Trim.Titlecase)
		      
		    End If
		    
		    row.Value("site") = cellRenderer
		    
		    If rs.Column("is_replan").BooleanValue Then
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("plan_type_name").StringValue.Trim + " (R)") 
		      
		    Else
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("plan_type_name").StringValue.Trim) 
		      
		    End If
		    
		    row.Value("plan_type") = cellRenderer
		    
		    Var completion_date As DateTime = rs.Column("completion_date").DateValue
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    completion_date.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    
		    row.Value("completion_date") = cellRenderer
		    
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("initials").StringValue.Trim.Uppercase)
		    row.Value("initials") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("physician_initials").StringValue.Trim.Uppercase)
		    row.Value("physician_initials") = cellRenderer
		    rows.Add(row)
		    
		    rs.MoveToNextRow
		  Wend
		  
		  rs.Close
		  
		  Return rows
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SortedPrimaryKeys(sortColumns as String) As Integer()
		  // Part of the WebDataSource interface.
		  
		  Var keys() As Integer 
		  
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id, " _
		  + "physics_tasking.patients.mrn As mrn, " _
		  + "physics_tasking.patients.first_name As first_name, " _
		  + "physics_tasking.patients.family_name As family_name, " _
		  + "physics_tasking.plan_types.name As plan_type_name, " _
		  + "physics_tasking.sites.name As site, " _
		  + "physics_tasking.sites.is_uppercase As is_uppercase, " _
		  + "physics_tasking.plans.due_date as due_date, " _
		  + "physics_tasking.users.first_name As u_first_name, " _
		  + "physics_tasking.users.family_name As u_family_name, " _
		  + "physics_tasking.users.initials As initials " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients ON " _
		  + "physics_tasking.plans.patient_id = physics_tasking.patients.patient_id " _
		  + "INNER JOIN physics_tasking.plan_types ON " _
		  + "physics_tasking.plans.plan_type_id = physics_tasking.plan_types.plan_type_id " _
		  + "INNER JOIN physics_tasking.sites ON " _
		  + "physics_tasking.plan_types.site_id = physics_tasking.sites.site_id " _
		  + "INNER JOIN physics_tasking.users ON " _
		  + "physics_tasking.plans.user_id = physics_tasking.users.user_id " _
		  + "WHERE physics_tasking.plans.is_completed = 1 AND " _
		  + "completion_date > '" + d_min.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "'" _
		  + "ORDER BY physics_tasking.plans.completion_date DESC, physics_tasking.patients.mrn ASC;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("plan_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys// Part of the WebDataSource interface.
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UnsortedPrimaryKeys() As Integer()
		  // Part of the WebDataSource interface.
		  
		  
		  Var keys() As Integer 
		  
		  Var d As DateTime = DateTime.Now
		  Var d_min As DateTime = New DateTime( d.Year, d.Month, d.Day)
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id " _
		  + "FROM physics_tasking.plans " _
		  + "WHERE physics_tasking.plans.is_completed = 1 " _
		  + "AND completion_date > '" + d_min.SubtractInterval( 0, 0, Physics_Tasking.Population_period_days).SQLDate  + "' " _
		  + "ORDER BY DATE(physics_tasking.plans.completion_date) DESC;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("plan_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys// Part of the WebDataSource interface.
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
