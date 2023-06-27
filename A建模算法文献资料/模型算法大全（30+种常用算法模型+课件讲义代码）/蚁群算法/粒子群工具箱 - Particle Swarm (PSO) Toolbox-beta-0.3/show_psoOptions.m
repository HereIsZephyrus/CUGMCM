%show_psoOptions >> A function to read and display the psoOptions structure.
%
% Usage          : strOptions = show_psoOptions( psoOptions )
% Arguments      : A structure containing various options for PSO
% Return Values  : A string containing the information abt the elements of the provided structure.
%
% History        :   Author      :   JAG (Jagatpreet Singh)
%                   Created on  :   06252003 (Wednesday. 25th June, 2003)
%                   Comments    :   A nice utility function.
%
%                   see also: get_psoOptions
%
function strOptions = show_psoOptions(IndentLevel, Variable)
if nargin < 1 disp(sprintf('\n\t:::No Options Structure provided:::\n')); return;
elseif nargin == 1 Variable = IndentLevel; IndentLevel = 1; end;

if IndentLevel < 1 IndentLevel = 1; end

subHeads = char(fieldnames(Variable));
indentTab = [sprintf('\t')];

strOptions = '';
for i=1:size(subHeads, 1)
    thisField = getfield(Variable, subHeads(i,:)); %assign the contents of the current structure element to thisField
    strOptions = [strOptions repmat(indentTab, 1, IndentLevel) subHeads(i,:)]; %Display upto the field name
    if isstruct(thisField)
        strOptions = [strOptions sprintf('\n') show_psoOptions(IndentLevel+1, thisField)]; %Write contents of the structure in next line
    else
        if ischar(thisField)
            strField = sprintf('%s', thisField);
        elseif isnumeric(thisField)
            strField = sprintf('%4.5g', thisField);
        else
            strField = sprintf(':::Can''t display item:::');
        end
        strOptions = [strOptions sprintf(' :') indentTab strField sprintf('\n')];
    end
end
        