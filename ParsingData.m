import javax.xml.xpath.*

DOMnode = xmlread('testParsing.xml');
getNodeName(DOMnode);
% get the xpath mechanism into the workspace
factory = XPathFactory.newInstance;
xpath = factory.newXPath;
fileID = fopen('testParsing.txt','w');

% compile and evaluate the XPath Expression
expression = xpath.compile('//Entry');
mainNode = expression.evaluate(DOMnode, XPathConstants.NODESET);

% mainNode.item(1).getElementsByTagName('PhoneNumber').item(1).getTextContent


for i=0 : mainNode.getLength-1 
    % for names 
     try
         name=mainNode.item(i).getElementsByTagName('Name').item(0).getTextContent;         
         fprintf(fileID,'%s',"Name:",name);
         fprintf(fileID,'\t');
     catch exception
         fprintf(fileID,"Name: not_found");
         fprintf(fileID,'\t');
     end
     % for address
     try
         name=mainNode.item(i).getElementsByTagName('Address').item(0).getTextContent;         
         fprintf(fileID,'%s',"Address:",name);
         fprintf(fileID,'\t');
     catch exception
         fprintf(fileID,"Address: not_found");
         fprintf(fileID,'\t');
     end
     % for Phone Number
     try
         name=mainNode.item(i).getElementsByTagName('PhoneNumber').item(0).getTextContent;         
         fprintf(fileID,'%s',"PhoneNumber:",name);
         fprintf(fileID,'\t');
     catch exception
         fprintf(fileID,"PhoneNumber: not_found");
         fprintf(fileID,'\t');
     end
     fprintf(fileID,'\n');
 end



fclose(fileID);
