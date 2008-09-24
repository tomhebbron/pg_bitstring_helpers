#include "postgres.h"
#include "catalog/pg_type.h"
#include "fmgr.h"
#include "funcapi.h"
#include "utils/varbit.h"
#include "utils/array.h"

#ifdef PG_MODULE_MAGIC
PG_MODULE_MAGIC;
#endif

Datum popcount( PG_FUNCTION_ARGS );
PG_FUNCTION_INFO_V1( popcount );

Datum popcount( PG_FUNCTION_ARGS )
{
  VarBit *arg1 = PG_GETARG_VARBIT_P(0);
  int32 result;
  int len, i;
  bits8 *b;
  bits8 mask;
  len = VARBITLEN(arg1);
  b = VARBITS(arg1);
  result = 0;
  for(i=0; i< VARBITBYTES(arg1); i++)
    {
      mask = *b++;
      while (mask)
        {
          if (mask & 1) result++;
          mask >>= 1;
        }
    }
  PG_RETURN_INT32(result);
}


Datum shuffled_ints( PG_FUNCTION_ARGS );
PG_FUNCTION_INFO_V1( shuffled_ints );

Datum shuffled_ints( PG_FUNCTION_ARGS )
{
  ArrayType *result;
  Datum *nums;
  long i, swap, limit;
  int64 tmp;
  limit = (long) PG_GETARG_INT64(0);
  nums = (Datum *)palloc(limit * sizeof(Datum));
  if (limit > 0)
    {
      for(i=0; i < limit; i++)
        {
          //elog( NOTICE, "%i", i );
          nums[i] = Int64GetDatum(i);
        }
      //elog(NOTICE,"finished building the array");
      //now shuffle
      for (i=limit-1; i >=0; i--)
        {
          swap = random()%(long)limit;
          //elog(NOTICE, "%i %i",i,swap);
          tmp = DatumGetInt64(nums[swap]);
          nums[swap] = nums[i];
          nums[i] = Int64GetDatum(tmp);
        }
    }
  result = construct_array(nums, limit, INT8OID, sizeof(int64), false,'d');
  pfree(nums);
  PG_RETURN_ARRAYTYPE_P(result);
}


