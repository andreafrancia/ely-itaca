function [values, info] = read_itaca(filename)
info=[];
f = fopen(filename);
for i = 1:55
    line = fgetl(f);
    [name, value] = split_header_line(line);
    if strcmp('EVENT_NAME', name)
        info = setfield(info, name, value);
    elseif strcmp('EVENT_ID',name)
        info = setfield(info, name, value);
    elseif strcmp('EVENT_DATE_YYYYMMDD',name)
        info = setfield(info, name, value);
    elseif strcmp('EVENT_TIME_HHMMSS',name)
        info = setfield(info, name, value);
    elseif strcmp('MAGNITUDE_L',name)
        value = sscanf(value, '%f');
        info = setfield(info, name, value);
    elseif strcmp('STATION_NAME',name)
        info = setfield(info, name, value);
    end
end

values = textscan(f, '%f');
values = values{1};
end

function [name, value] = split_header_line(line)

colon_position = strfind(line, ':');
name=line(1:colon_position-1);
value=strtrim(line(colon_position+1:length(line)));

end
