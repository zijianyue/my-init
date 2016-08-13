#include "inc.h"
#include <vector>
#include <map>

/*******************************************************************************
Func Name       : proc_attr
Date Created    : 2016-04-16
Author          : gezijian
Description     : 
Input           :
Output          :
Return          : void
Caution         :
*******************************************************************************/
void proc_attr( short *pskey, 
                char cAttr,
                void *pThis)
{
    TAG_TYPE_S abc;
    abc.abb;
    abc.sbl;                    
    std::vector<int> intvec;
    proc_attr( pskey, cAttr, pThis );
    intvec.push_back( 1 );
    intvec.push_back(2);
    return;
}
