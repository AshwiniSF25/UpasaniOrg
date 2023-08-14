public with sharing class Utlities {
    
    public static List<String[]> parseCSVFileAsList(string fileBody)
    {
    	if (fileBody == null)
    		return new List<String[]>{new String[]{}, new String[]{null}};
    		
		List<String[]> lines = new List<String[]>();
		Boolean within = false;
		String[] line = new String[]{};
		
		String lastMeaningfulChar = null;
		String col = '';
		Integer i = -1;
		
		while (++i < fileBody.length())
		{
			String currChar = fileBody.substring(i, i + 1);
			if (within)
			{
				if (currChar == '"') 
				{
					if (fileBody.length() > i + 1 && fileBody.substring(i + 1, i + 2) == '"')
					{
						col += '"';
						lastMeaningfulChar = '"';
						i++;
					}
					else
						within = false;
				}
				else
				{
					col += currChar;
					lastMeaningfulChar = currChar;
				}
			}
			else
			{
				
				if (currChar == ',')
				{
					line.add(col);
					lastMeaningfulChar = ',';
					col = '';
				}
				else if (currChar == '"')
				{
					if (lastMeaningfulChar == ',')
						within = true;
					else
					{
						col += '"';
						lastMeaningfulChar = '"';
						i++;
					}
				}
				else if (currChar == '\n' || currChar == '\r')
				{
					if (lastMeaningfulChar != '\n' && lastMeaningfulChar != '\r')
					{
						lastMeaningfulChar = currChar;
						line.add(col);
						lines.add(line);
						line = new String[]{};
						col = '';
					}
				}
				else
				{
					col += currChar;
					lastMeaningfulChar = currChar;
				}
			}
		}
		
		line.add(col);
		lines.add(line);
		
		return lines;
    }

    public static List<String[]> parseCSVFile(string fileBody)
    {
        if (fileBody == null)
            return new List<String[]>{new String[]{}, new String[]{null}};
            
        boolean openQuote = false;
        boolean beginLine = true;
        String[] retVal = new String[2];
        
        List<String[]> line = new List<String[]>();
        String[] cols = new String[]{};
        String col = '';
        integer i = 0;
        while (i < fileBody.length())
        {
            String currChar = fileBody.substring(i, i + 1), nextChar = '';
            if (i + 1 < fileBody.length())
                nextChar = fileBody.substring(i + 1, i + 2);
                
            if ((currChar == '\r' || currChar == '\n') && !openQuote)
            {
                if (beginLine)
                {
                    i++;
                    continue;
                }
                else
                {
                    cols.add(col.trim());
                    line.add(cols);
                    if (i + 1 < fileBody.length())
                        line.add(new String[]{fileBody.substring(i + 1)});
                    else
                        line.add(new String[]{null});
                        
                    return line;
                }
            }
            else
            {
                beginLine = false;
                if (currChar == '"')
                {
                    if (nextChar == '"')
                    {
                        col += '"';
                        i += 2;
                        continue;
                    }
                    else
                    {
                        openQuote = !openQuote;
                        i++;
                        continue;
                    }
                }
                else if (currChar == ',' && !openQuote)
                {
                    cols.add(col.trim());
                    col = '';
                    i++;
                    continue;
                }
                
                col += currChar;
                i++;
            }
        }
        
        if (col != '' || fileBody.substring(i - 1) == ',')
            cols.add(col.trim());
            
        line.add(cols);
        line.add(new String[]{null});
        return line;
    }
}