def construct_1d_arraylike_from_scalar(value, length, dtype):
    """
    create a np.ndarray / pandas type of specified shape and dtype
    filled with values

    Parameters
    ----------
    value : scalar value
    length : int
    dtype : pandas_dtype / np.dtype

    Returns
    -------
    np.ndarray / pandas type of length, filled with value

    """
    if is_datetime64tz_dtype(dtype):
        from pandas import DatetimeIndex
        subarr = DatetimeIndex([value] * length, dtype=dtype)
    elif is_categorical_dtype(dtype):
        from pandas import Categorical
        subarr = Categorical([value] * length, dtype=dtype)
    else:
        if not isinstance(dtype, (np.dtype, type(np.dtype))):
            dtype = dtype.dtype

        if length and is_integer_dtype(dtype) and isna(value):
            # coerce if we have nan for an integer dtype
            dtype = np.dtype('float64')
        elif isinstance(dtype, np.dtype) and dtype.kind in ("U", "S"):
            # we need to coerce to object dtype to avoid
            # to allow numpy to take our string as a scalar value
            dtype = object
            if not isna(value):
                value = to_str(value)

        subarr = np.empty(length, dtype=dtype)
        subarr.fill(value)

    return subarr