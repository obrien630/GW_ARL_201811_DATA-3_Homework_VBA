Attribute VB_Name = "Module1"
Sub SumofTickerVolumeByYear()

    Dim ws As Worksheet
    Dim starting_ws As Worksheet
    Set starting_ws = ActiveSheet

    For Each ws In ThisWorkbook.Worksheets
    ws.Activate
    
      ' Set an initial variable for holding the ticker name
      Dim Ticker_Symbol As String
      Cells(1, 11).Value = "Ticker Symbol"
    
      ' Set an initial variable for holding the total per ticker symbol
      Dim Ticker_Volume As Double
      Ticker_Volume = 0
      Cells(1, 12).Value = "Ticker Volume"
      
    
      ' Keep track of the location for each ticker symbol in the summary table
      Dim Summary_Table_Row As Integer
      Summary_Table_Row = 2
    
      'Find last row in worksheet
      LastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
    
      ' Loop through all ticker symbols
      For I = 2 To LastRow
      
        ' Check if we  are still within the same ticker symbol, if it is not...
        If Cells(I + 1, 1).Value <> Cells(I, 1).Value Then
    
              ' Set the Symbol name
              Ticker_Symbol = Cells(I, 1).Value
        
              ' Add to the Symbol Total
              Ticker_Volume = Ticker_Volume + Cells(I, 7).Value
        
              ' Print the Ticker Symbol in the Summary Table
              Range("K" & Summary_Table_Row).Value = Ticker_Symbol
        
              ' Print the Ticker Total to the Summary Table
              Range("L" & Summary_Table_Row).Value = Ticker_Volume
        
              ' Add one to the summary table row
              Summary_Table_Row = Summary_Table_Row + 1
              
              ' Reset the Ticker Total
              Ticker_Volume = 0
        
        ' If the cell immediately following a row is the same brand...
        Else
    
              ' Add to the Ticker Total
              Ticker_Volume = Ticker_Volume + Cells(I, 7).Value

         End If

     Next I
  
Next ws

End Sub


