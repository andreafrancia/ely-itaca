function [values, headers] = read_itaca(filename)
headers=[];
f = fopen(filename);
for i = 1:55
    line = fgetl(f);
    r = textscan(line, '%s %s');
    name = r{1}{1};
    if name(length(name)) == ":"
        name=name(1:length(name)-1);
    end
    if length(r{2})
        value = r{2}{1};
        if sscanf(value, '%f')
            value = sscanf(value, '%f');
        end
        headers = setfield(headers, name, value);
    end
    
end

values = textscan(f, '%f');
values = values{1};
end
