function git(varargin)

[status,~] = system('git status');

if (status==0)
    arguments = parse(varargin{:});
    [~,results] = system(['git ',arguments]);
    disp (results)
elseif (status==128)
    warning('no git repository found')
    arguments = parse(varargin{:});
    if strcmp(arguments,'init ')
        [~,results] = system(['git ',arguments]);
        disp('new git repository created')
    end
else
    warning('git not installed')
end
end

function space_delimited_list = parse(varargin)
space_delimited_list = cell2mat(...
    cellfun(@(s)([s,' ']),varargin,'UniformOutput',false));
end
