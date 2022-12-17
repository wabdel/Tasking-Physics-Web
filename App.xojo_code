#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Opening(args() as String)
		  
		  Var db_status As Boolean = Physics_Tasking.isDatabase_Online
		  Physics_Tasking.POPULATE_Main_Data
		  'Points_Container = New WEBCONTAINER_Points
		  last_database_update = DateTime.Now
		  POPULATE_Color_Set
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CALCULATE_Planning_Probability(id as integer) As double
		  Var sql As String = "SELECT COUNT(user_id) as count, AVG(total) as sum, STDDEV_SAMP(total) as std " _
		  + "FROM physics_tasking.points " _
		  + "WHERE is_active = TRUE;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  If rs.Column("count").IntegerValue = 1 Then Return 1.0
		  
		  
		  
		  Var p11 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(2.0)
		  Var p1 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(1.0)
		  
		  Var p2 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(0)
		  Var p3 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-1.0)
		  Var p4 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-2.0)
		  
		  Var normalization As Double = 0
		  
		  
		  sql = "SELECT user_id, total " _
		  + "FROM physics_tasking.points " _
		  + "WHERE is_active = TRUE;"
		  
		  Var rs_planners As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  Var id_probability As Double = 0
		  
		  While Not rs_planners.AfterLastRow
		    
		    Var z As Double = (rs_planners.Column("total").DoubleValue - rs.Column("sum").DoubleValue) / _
		    rs.Column("std").DoubleValue
		    Var p As Double = 1 - Numerical_Recipies.Cummulative_Normal_Distribution(z)
		    normalization = normalization + p
		    
		    If rs_planners.Column("user_id").IntegerValue = id Then id_probability = p
		    
		    rs_planners.MoveToNextRow
		    
		  Wend
		  
		  Return (1 - id_probability) / normalization
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CALCULATE_Planning_Probability1()
		  'Physics_Tasking.Users.Sort( AddressOf Physics_Tasking.SORT_User_Records_points )
		  '
		  '// GET List of Planners
		  'planner_id.ResizeTo(-1)
		  'planner_prob.ResizeTo(-1)
		  'planner_plan_points.ResizeTo(-1)
		  'planner_task_points.ResizeTo(-1)
		  'planner_total_points.ResizeTo(-1)
		  'planner_status.ResizeTo(-1)
		  'planner_initial.ResizeTo(-1)
		  '
		  'Var d As DateTime = DateTime.Now
		  '
		  'Var sum As Double = 0
		  'Var sum2 As Double = 0
		  'Var count As Integer = 0 
		  'For Each item As Physics_Tasking.CLASS_User_Record In Physics_Tasking.Users
		  '
		  'If Not item.isRetired And ( item.Group.id = 2 Or item.Group.id = 3) Then
		  '
		  'planner_id.Add( item.id)
		  'planner_initial.Add( item.initials)
		  '
		  'Var p As Double =  item.GET_Total_Plan_Points( d)
		  'Var t As Double =  item.GET_Total_Task_Points( d)
		  '
		  'planner_plan_points.Add( p)
		  'planner_task_points.Add( t)
		  'planner_total_points.Add( p + t )
		  '
		  'If item.isActive Then
		  '
		  'sum = sum + p + t
		  'sum2 = sum2 + (p + t) * (p + t)
		  'count = count + 1
		  'planner_status.Add( True)
		  '
		  'Else
		  '
		  'planner_status.Add( False)
		  '
		  '
		  'End If
		  '
		  'End If
		  '
		  'Next item
		  '
		  '// avg
		  'Points_Average = sum / count
		  '
		  '
		  '
		  'If count = 1 Then
		  '
		  'planner_prob.Add(1)
		  'Return
		  '
		  'End If
		  '
		  ''Var variance As Double = ( sum2 - (sum * sum) / count) /(count -1)
		  ''
		  ''If variance = 0 Then
		  ''
		  ''
		  ''For i As Integer = 0 To planner_id.LastIndex
		  ''
		  ''If planner_status(i) Then planner_prob.Add( 1.0 / count )
		  ''
		  ''Next i
		  ''
		  ''End If
		  ''
		  ''Points_Stdev = Sqrt( variance)
		  ''
		  ''Var p11 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(2.0)
		  ''Var p1 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(1.0)
		  ''
		  ''Var p2 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(0)
		  ''Var p3 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-1.0)
		  ''Var p4 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-2.0)
		  ''
		  ''Var normalization As Double = 0
		  ''
		  ''For i As Integer = 0 To planner_id.LastIndex
		  ''
		  ''If planner_status(i) Then
		  ''
		  ''Var z As Double = (planner_total_points(i) - Points_Average)/Points_Stdev
		  ''Var p As Double = 1 - Numerical_Recipies.Cummulative_Normal_Distribution(z)
		  ''normalization = normalization + p
		  ''
		  ''End If
		  ''Next
		  ''
		  ''For i As Integer = 0 To planner_id.LastIndex
		  ''
		  ''If planner_status(i) Then
		  ''
		  ''Var z As Double = (planner_total_points(i) - Points_Average)/Points_Stdev
		  ''Var p As Double = 1 - Numerical_Recipies.Cummulative_Normal_Distribution(z)
		  ''planner_prob.add( (1-p) / normalization)
		  ''
		  ''Else
		  ''
		  ''planner_prob.Add( 0)
		  ''
		  ''End If
		  ''Next
		  '
		  '
		  '
		  '
		  '
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub POPULATE_Color_Set()
		  Color_Set.Add( &c267278)
		  Color_Set.Add( &c653380)
		  Color_Set.Add( &c4770b3)
		  Color_Set.Add( &cD21F75)
		  Color_Set.Add( &c3b3689)
		  Color_Set.Add( &c50AED3)
		  //----------------------------
		  Color_Set.Add( &c48b24f)
		  Color_Set.Add( &cE57438)
		  Color_Set.Add( &c569DD2)
		  Color_Set.Add( &c569D79)
		  Color_Set.Add( &c58595b)
		  Color_Set.Add( &cE4B031)
		  //----------------------------
		  'Color_Set.Add( &c84D2F4)
		  Color_Set.Add( &cCAD93F)
		  Color_Set.Add( &cF5C8AF)
		  Color_Set.Add( &c9AC4B3)
		  Color_Set.Add( &c9E9EA2)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ananomize As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		Color_Set() As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		Colour_Fail As Color = &cED293900
	#tag EndProperty

	#tag Property, Flags = &h0
		Colour_Note As Color = &cFFDF0000
	#tag EndProperty

	#tag Property, Flags = &h0
		Colour_Pass As Color = &c05e17700
	#tag EndProperty

	#tag Property, Flags = &h0
		Colour_Title As Color = &cFEACA700
	#tag EndProperty

	#tag Property, Flags = &h0
		Colour_Warn As Color = &cFE922700
	#tag EndProperty

	#tag Property, Flags = &h0
		last_database_update As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlans_List_LastUpdate As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTasks_List_LastUpdate As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		planner_id() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		planner_initial() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		planner_plan_points() As double
	#tag EndProperty

	#tag Property, Flags = &h0
		planner_prob() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		planner_status() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		planner_task_points() As double
	#tag EndProperty

	#tag Property, Flags = &h0
		planner_total_points() As double
	#tag EndProperty

	#tag Property, Flags = &h0
		Points_Average As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Points_Stdev As Double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ananomize"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Points_Average"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Points_Stdev"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Colour_Fail"
			Visible=false
			Group="Behavior"
			InitialValue="&cED293900"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Colour_Pass"
			Visible=false
			Group="Behavior"
			InitialValue="&c05e17700"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Colour_Warn"
			Visible=false
			Group="Behavior"
			InitialValue="&cFE922700"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Colour_Note"
			Visible=false
			Group="Behavior"
			InitialValue="&c05e17700"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
