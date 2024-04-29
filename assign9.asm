.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

DAYS = 7     
HOURS = 24   
MINUTES = 60  
SECONDS = 60  

.data

date_time DWORD ? 
num_of_iters DWORD 0  
day BYTE DAYS   
hour BYTE HOURS  
minute BYTE MINUTES  
    
.code
main proc

    mov [date_time], -1                     
    mov ecx, DAYS
    _DAYS:
        mov day, cl

        mov [date_time + 1], -1              
        mov ecx, HOURS
        _HOURS:
            mov hour, cl

            mov [date_time + 2], -1          
            mov ecx, MINUTES
            _MINUTES:
                mov minute, cl

                mov [date_time + 3], -1     
                mov ecx, SECONDS
                _SECONDS:
                    add [date_time + 3], 1  
                    add num_of_iters, 1
                loop _SECONDS

                add [date_time + 2], 1      
                mov cl, minute
            loop _MINUTES

            add [date_time + 1], 1          
            mov cl, hour
        loop _HOURS

        add [date_time], 1                  
        mov cl, day
    loop _DAYS                              

    invoke ExitProcess,0
main endp
end main
