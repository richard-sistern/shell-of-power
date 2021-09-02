# Transfer all FSMO roles to a target machine

# Roles:
# 0	PDC Emulator
# 1	RID Master
# 2	Infrastructure Master
# 3	Schema Master
# 4	Domain Naming Master

Move-ADDirectoryServerOperationMasterRole -Identity "Target DC" –OperationMasterRole 0,1,2,3,4 -Confirm:$false -Force

