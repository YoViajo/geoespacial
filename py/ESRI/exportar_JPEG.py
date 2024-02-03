#
# Exportar páginas a formato JPEG
# Data driven documents
#

I have my script for exporting multiple DDP exports to JPEG format:

>>> import arcpy
... mxd = arcpy.mapping.MapDocument("CURRENT")
... for pageNum in range(1, mxd.dataDrivenPages.pageCount + 1):
...     mxd.dataDrivenPages.currentPageID = pageNum
...     print "Exporting page {0} of {1}".format(str(mxd.dataDrivenPages.currentPageID), str(mxd.dataDrivenPages.pageCount))
...     arcpy.mapping.ExportToPNG(mxd, r"X:\DVDs to burn\South Atlantic Margins\Arcview projects\A3 & A4 Images and Export mxd's\2014 DDP A3 Exports\Images\Free Air" + str(pageNum) + ".jpg")
... del mxd


import arcpy 
mxd = arcpy.mapping.MapDocument("CURRENT") 
pageNumbers = [1,2,3,4,9,10,45] #put your page numbers in brackets separated by commas
for pageNum in pageNumbers:
  mxd.dataDrivenPages.currentPageID = pageNum 
  print "Exporting page {0} of {1}".format(str(mxd.dataDrivenPages.currentPageID), str(mxd.dataDrivenPages.pageCount)) 
  arcpy.mapping.ExportToJPEG(mxd, r"X:\DVDs to burn\South Atlantic Margins\Arcview projects\A3 & A4 Images and Export mxd's\2014 DDP A3 Exports\Images\Free Air" + str(pageNum) + ".jpg") 
del mxd

>>> import arcpy
... mxd = arcpy.mapping.MapDocument("CURRENT") #here I choose to export from the current mxd I'm running python from
... pageNumbers = [2,4,6,8] #here I have selected the page range I want exported
... for pageNum in pageNumbers:
...     mxd.dataDrivenPages.currentPageID = pageNum
...     pageName = mxd.dataDrivenPages.pageRow.Name #here is a line I found elsewhere telling python where it can find the page name
...     print "Exporting page {0} of {1}".format(str(mxd.dataDrivenPages.currentPageID), str(mxd.dataDrivenPages.pageCount))
...     arcpy.mapping.ExportToTIFF(mxd, r"C:\FolderForExports\FILEname" + str(pageName) + ".tif") #here I've chose TIFF as my format and told python to add the page name to the end of each exported file
... del mxd

