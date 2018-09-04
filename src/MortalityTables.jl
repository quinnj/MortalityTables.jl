module MortalityTables
import XMLDict
import DataStructures

include("tableProcessor.jl")

function qx(table::XTbMLTable, issueAge, duration)

    if length(table.select) > 0
        q = table.select[issueAge][duration]
    else
        q = missing
    end

    if ismissing(q)
        q = table.ultimate[issueAge + duration - 1]
    end
    return q
end

function qx(table::XTbMLTable, age)
    return table.ultimate[age]
end

end # module

export Tables,loadXTbMLTable, qx