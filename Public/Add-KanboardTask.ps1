Function Add-KanboardTask {
    <#
    .SYNOPSIS
    Create a new task.
    .DESCRIPTION
    Create a new task.
    .EXAMPLE
    
    #>  
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Title,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [int]
        $ProjectId,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $ColorId,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $ColumnId,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $OwnerId,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $CreatorId,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [datetime]
        $DateDue,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Description,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $CategoryId,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $Score,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $SwimlaneId,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $Priority,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $RecurrenceStatus,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $RecurrenceTrigger,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $RecurrenceFactor,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $RecurrenceTimeframe,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $RecurrenceBasedate,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Reference,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Tags,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [datetime]
        $DateStarted
    )

    $Request = @{
        jsonrpc="2.0"
        method="createTask"
        id=1
    } 

    Write-Verbose "PSBoundParameter: $($PSBoundParameters.GetEnumerator())"

    foreach ($param in $PSBoundParameters.GetEnumerator()) {
        switch ($param.Key) {
            'IssueIid' { $query = $query + "&iid=$($param.Value)" }
            'Title' { $query = $query + "&title=$($param.Value)" }
            'Description' { $query = $query + "&description=$($param.Value)" }
            'Confidential' { $bool = $param.Value.ToString().ToLower() ; $query = $query + "&confidential=$($bool)" }
            'AssigneeIds' { $assignees = $param.Value -join "," ; $query = $query + "&assignee_ids=$($assignees)" }
            'MilestoneId' { $query = $query + "&milestone_id=$($param.Value)" }
            'Labels' { $query = $query + "&labels=$($param.Value)" }
            'CreatedAt' { $date = $param.Value.ToString("yyyy-MM-dd\THH\:mm\:ss") ; $query = $query + "&created_at=$($date)" }
            'DueDate' { $date = $param.Value.ToString("yyyy-MM-dd") ; $query = $query + "&due_date=$($date)" }
            'MergeRequestToResolveDiscussionsOf' { $query = $query + "&merge_request_to_resolve_discussions_of=$($param.Value)" }
            'DiscussionToResolve' { $query = $query + "&discussion_to_resolve=$($param.Value)" }
            'Weight' { $query = $query + "&weight=$($param.Value)" }
            'EpicId' { $query = $query + "&epic_id=$($param.Value)" }
            'EpicIid' { $query = $query + "&epic_iid=$($param.Value)" }
            Default {}
        }
    }

    # Remove Whitespace

    $query = $query -replace '\s', '%20'

    $response = Invoke-KanboardAPI -Request ($Request | ConvertTo-Json)

    $response
}