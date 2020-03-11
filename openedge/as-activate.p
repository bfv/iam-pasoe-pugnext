
block-level on error undo, throw.

define variable hCP as handle no-undo.
define variable i as integer no-undo.
define variable propertyCount as integer no-undo.
define variable propertyName as character no-undo.


hCP = session:current-request-info:GetClientPrincipal().

message substitute("as-activate.p, cp valid: &1", valid-handle(hCP)).
// message "cp properties:" hCP:list-property-names() hcp:get-property("x-groups").

if (not valid-handle(hCP)) then
  return.

propertyCount = num-entries(hCP:list-property-names()).
do i = 1 to propertyCount:
  propertyName = entry(i, hCP:list-property-names()).
  message "  " propertyName hcp:get-property(propertyName).
end.

message "cp:user-id" hcp:user-id.
message "cp:domain-name:" hcp:domain-name.

message "state:" hcp:login-state hcp:state-detail.

set-db-client(hcp).
